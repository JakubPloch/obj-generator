;; Link do środowiska online: https://www.jdoodle.com/execute-clisp-online

;; Skalowanie obiektu - mnożenie macierzy przez skalar

(defun multiply-matrix (matrix scale)
  (dotimes (i (array-dimension matrix 0))
    (dotimes (j (array-dimension matrix 1))
      (setf (aref matrix i j) (* scale (aref matrix i j))))))

;; Funkcje przesuwające wszystkie wierzchołki w danej osi 
;; poprzez dodanie wartości do każdej z kolumn macierzy

(defun move-in-x-axis (matrix value)
 (dotimes (i (array-dimension matrix 0))
    (setf (aref matrix i 0) (+ value (aref matrix i 0)))))

(defun move-in-z-axis (matrix value)
 (dotimes (i (array-dimension matrix 0))
    (setf (aref matrix i 1) (+ value (aref matrix i 1)))))

(defun move-in-y-axis (matrix value)
 (dotimes (i (array-dimension matrix 0))
    (setf (aref matrix i 2) (+ value (aref matrix i 2)))))

;; Wypisanie wierszy macierzy poprzedzonych znakiem "v" oraz elementami oddzielonymi znakiem spacji

(defun print-matrix-with_v_prefix (matrix)
  (dotimes (i (array-dimension matrix 0))
    (format t "v ")
    (dotimes (j (array-dimension matrix 1))
      (format t "~a " (aref matrix i j)))
    (format t "~%")))

;; Funkcja tworząca domyślną macierz

(defun create-default-matrix-vertices()
  (make-array '(8 3)  :initial-contents '
    ((-1 -1 1)
    (-1 1 1)
    (-1 -1 -1)
    (-1 1 -1)
    (1 -1 1)
    (1 1 1)
    (1 -1 -1)
    (1 1 -1)
    )))

;; Funkcja generująca wierzchołki wyjściowego obiektu 3D poprzez operacje na domyślnej macierzy

(defun generate-vertices(scale x z y)
  (let ((matrix (create-default-matrix-vertices)))
    (multiply-matrix matrix scale)
    (move-in-x-axis matrix x)
    (move-in-z-axis matrix z)
    (move-in-y-axis matrix y)
    (print-matrix-with_v_prefix matrix)
    (print-default-faces)
    ))

;; Wypisanie linii odpowiedzialnych za zdefiniowanie ścian obiektu 3D

(defun print-default-faces()
  (format t "f 1//1 5//1 7//1 3//1~%")
  (format t "f 4//2 3//2 7//2 8//2~%")
  (format t "f 8//3 7//3 5//3 6//3~%")
  (format t "f 6//4 2//4 4//4 8//4~%")
  (format t "f 2//5 1//5 3//5 4//5~%")
  (format t "f 6//6 5//6 1//6 2//6~%"))

;; Wywołanie funkcji stanowiącej główną funkcjonalność skryptu

(generate-vertices 5 6 7 8)