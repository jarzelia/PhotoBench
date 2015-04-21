#lang racket

(require racket/gui/base
         racket/include
         (file "test.rkt"))

;;Creates the top level window
(define frame (new frame%
                   [label "Photobench"]
                   [width 900]
                   [height 600]))

;;Words for the window
(define msg (new message% [parent frame]
                 [label "HELLO! HELLO! HELLO! HELLO!"]
                 [auto-resize #t]))


;;Menu bar, start
(define menubar (new menu-bar% [parent frame]))

(define menufile (new menu%              ;;file menu
                   [label "File"]
                   [parent menubar]))

(define menuedit (new menu%              ;;edit menu
                      [label "Edit"]
                      [parent menubar]))

(define test (new menu-item%             ;;placeholder
                  [label "asdasf2"]
                  [parent menufile]
                  [callback (lambda (b e)(send msg set-label "doing file stuff"))]))

(define savebutt (new menu-item%        ;;save, creates a popup dialog
                      [label "Save"]
                      [parent menufile]
                      [callback (lambda (b e) (let ((m (new dialog% [label "Are you sure"]
                                                   [parent frame])))
                                                (send m show #t))
                                  )]))

(define test2 (new menu-item%             ;;placeholder
                  [label "asdasf2"]
                  [parent menuedit]
                  [callback (lambda (b e)(send msg set-label "doing edit stuff"))]))

;USed for spacing
(define overall (new horizontal-panel% [parent frame]
                 ))

(define iconpanel (new vertical-panel% [parent overall]
                       [style '(border)]
                       [border 2]
                       [min-width 100]
                       [stretchable-width #f]))

(define openbutton (new button% [parent iconpanel]
     [label "Open"]
     ; Button Click, changes the message
     [callback (lambda (button event)
                 (open-file "file.bmp" canvas))]))

(define canvas (new canvas% [parent overall]
                    [style '(border)]))

(send frame show #t)