
;; counter
;; <add a description here>

;; constants
;;
(define-constant CONTRACT-OWNER tx-sender)
(define-constant ERR_NO_SETTER_PRESENT u100)

;; data maps and vars
;;
(define-data-var count uint u0)
(define-data-var last-setter (optional principal) none)

;; private functions
;;

;; public functions
;;
(define-public (increment)
  (let
    (
      (new-count (+ (get-count) u1))
    )
    (var-set count new-count)
    (var-set last-setter (some tx-sender))
    (ok (get-count))
  )
)

(define-public (decrement)
  (let
    (
      (new-count (- (get-count) u1))
    )
    (var-set count new-count)
    (var-set last-setter (some tx-sender))
    (ok (var-get count))
  )
)

;; read-only functions
(define-read-only (get-count)
  (var-get count)
)

(define-read-only (get-last-setter)
  (unwrap-panic (var-get last-setter))
)
