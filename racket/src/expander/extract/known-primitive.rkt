#lang racket/base
(require "../compile/known.rkt")

(provide register-known-primitives!)

(define (register-known-primitives! seen-defns)
  ;; Register some core primitives that have specific properties:
  (hash-set! seen-defns 'struct:exn:fail (known-struct-op 'struct-type 2))
  (hash-set! seen-defns 'make-thread-cell (known-struct-op 'constructor 1))
  (hash-set! seen-defns 'make-continuation-prompt-tag (known-struct-op 'constructor 1))
  (hash-set! seen-defns 'make-weak-hash (known-struct-op 'constructor 0))
  (hash-set! seen-defns 'gensym (known-struct-op 'constructor 0))
  (hash-set! seen-defns 'string (known-struct-op 'constructor 2))
  (hash-set! seen-defns 'cons (known-struct-op 'constructor 2))
  (hash-set! seen-defns 'eq? (known-struct-op 'constructor 2))
  (hash-set! seen-defns 'not (known-predicate 'anything))
  (hash-set! seen-defns 'null? (known-predicate 'null))
  (hash-set! seen-defns 'integer? (known-predicate 'integer))
  (hash-set! seen-defns 'list? (known-predicate 'list))
  (hash-set! seen-defns 'length (known-function-of-satisfying '(list)))
  (hash-set! seen-defns 'arity-at-least? (known-predicate 'arity-at-least))
  (hash-set! seen-defns 'arity-at-least-value (known-function-of-satisfying '(arity-at-least)))
  (hash-set! seen-defns 'procedure? (known-predicate 'procedure))
  (hash-set! seen-defns 'procedure-arity (known-function-of-satisfying '(procedure))))
