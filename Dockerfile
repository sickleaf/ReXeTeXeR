FROM alpine:3.11

# install xetex
RUN apk add openssl make texlive-full git
#RUN apk --no-cache add openssl make texlive-xetex texlive && \
  # latex package -> xelatex package
  #mv /usr/share/texmf-dist/tex/latex/ /usr/share/texmf-dist/tex/xelatex/

#RUN apk add texlive-lang-japanese

# bibtex
ADD ./src/junsrt.bst /usr/share/texmf-dist/bibtex/bst/base/

# BXjscls
ADD ./src/BXjscls/*.* /usr/share/texmf-dist/tex/xelatex/bxjscls/

RUN git clone https://github.com/texjporg/ascmac /usr/share/texmf-dist/tex/xelatex/bxjscls/ascmac


RUN git clone https://github.com/T-F-S/tcolorbox /usr/share/texmf-dist/tex/xelatex/bxjscls/tcolorbox


RUN git clone https://github.com/zr-tex8r/ZXjatype /usr/share/texmf-dist/tex/xelatex/bxjscls/ZXjatype

RUN git clone https://github.com/zr-tex8r/ZXjafont /usr/share/texmf-dist/tex/xelatex/bxjscls/ZXjafont

RUN mktexlsr
