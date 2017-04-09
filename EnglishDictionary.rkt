#lang racket
;joao


; What to do?
; --> learn github
; --> have one window "create" another (parent/child frames) - done 
; --> resize windows - done
; --> design a game window/ how to position things on a window, choose random choices - done
; --> design main window -  
; --> append string -done
; --> print a string on the window.

(require net/url net/sendurl)
(require racket/gui (only-in srfi/13 string-constains) json)
(define word-list (list "one" "two" "three" "four" "five" "six" "seven" "eight" "nine" "ten"))

(define button_enabled #t)

(define app_id  "app_id: 7b58b972")
(define app_key "app_key: b70c1d9cbbc48700a36ac012292c533c")

(define main_frame (new frame% [label "main"]
                        [height 500]
                        [width 500]))

(define game_frame (new frame% [label "game"]
                         [height 500]
                         [width 500]
                         [parent main_frame]))

(define word-field (new text-field% [parent main_frame]
[label "word:"]))

(new button% [parent main_frame]
     [label "Search a word"]
     [callback (λ (button e)
                 (new message% [label (search-word (send word-field get-value))]
                      [parent main_frame]))])

;; this button is initially set to false; change to true when there
;; are enough words to play a game.

(new button% [parent main_frame]
  [label "Play a game"]
  [callback (λ (button e)
              (send game_frame show #t))]
  [enabled button_enabled])

;;;;; create a random num in between 0 and (upper-bound - 1)

(define (create-rdm-num upper-bound) 
   (modulo (eval (date-second (seconds->date(current-seconds)))) upper-bound))

;;; create a list with 3 possible answers
(define (possible-answ list num rdm-num)
  (if (= num rdm-num)
      (car list)
      (possible-answ (cdr list) (+ num 1) rdm-num)))


(new button% [parent game_frame]
     [label (possible-answ word-list 0 1)]
     [callback (λ (button e)
                 1)])

(new button% [parent game_frame]
     [label (possible-answ word-list 0 1) ]
     [callback (λ (button e)
                 1)])

(new button% [parent game_frame]
     [label (possible-answ word-list 0 1)]
     [callback (λ (button e)
                 1)])

;;why is this giving me an error?
;(new button% [parent game_frame]
;     [label (possible-answ word-list 0 (create-rdm-num 10))]
;    [callback (λ (button e)
;                 1)])



(send main_frame show #t)

(define (search-word word)
  (string-append word " was searched"))



;------------

(define open_api "https://od-api.oxforddictionaries.com:443/api/v1/entries/en/")
(define (search w)

  
 
  (define con-url (string->url (string-append open_api w)))
  (define dict-port (get-pure-port con-url (list app_id app_key)))
  (define respond (port->string dict-port))

  
  (close-input-port dict-port)
  
  (cond ((number? (string-contains respond "404 Not Found")) (printf "Not Found"))
        (else
         (searchDict (readjson-from-input respond) '|word| "word        : ")
         (searchDict (readjson-from-input respond) '|definitions| "definitions : ")
         (searchDict (readjson-from-input respond) '|examples| "examples    : ")
         (searchDict (readjson-from-input respond) '|audioFile| "pronunciation : "))
  ))
 
)




(define (readjson-from-input var)
  (with-input-from-string var
    (lambda () (read-json)))
      
  )



(define (searchDict hash k des)
  (cond ((list? hash)  (searchDict (car hash) k des))
        ((and (hash? hash) (not (empty? (hash-ref hash k (lambda () empty))))) (display hash k des))     
        (else        
         (cond ((hash? hash)              
                (for (((key val) (in-hash hash)))
                  (searchDict (hash-ref hash key) k des)))                  
               (else hash)))))

(define (display hash k des)
  (cond
    
    ((list? (hash-ref hash k))
     (cond
       ((string? (car (hash-ref hash k))) (printf "~a~a\n" des (car (hash-ref hash k))))
       (else
        (show (hash-ref hash k) k des))))
    (else (printf "~a~a\n" des (hash-ref hash k (lambda () ""))))
  ))

  



(define (show lst k des)
  (cond ((null? lst) lst)
        (else
         (for (((key val) (in-hash (car lst )))) 
           (printf "~a~a\n" des val ))

         (show (cdr lst) k des)
         )))

(define (playSound path)
  (play-sound path #t)
)

(define (getSound url)
  (send-url url)
)



