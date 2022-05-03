INSTRUCTION FOR THE COMPILATION

Unix/Unix-like systems
    ./tesicmp

Other systems
    Compile in this order:
    1. pdflatex Tesi
    2. pdflatex Tesi-frn
    3. bibtex Tesi
    4. pdflatex Tesi
    5. pdflatex Tesi

Required package and program:
    - pdflatex (tested with latex 2020)
    - bibtex
    packages:
    - geometry
    - fontenc
    - inputenc
    - babel
    - csquotes
    - frontespizio
    - subcaption
    - amsmath
    - amssymb
    - physics
    - bm
    - hyperref
    - pgfplots
    - environ

