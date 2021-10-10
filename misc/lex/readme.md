## Add your LEX codes here ...

## What is Lex?
[Lex](https://en.wikipedia.org/wiki/Lex_(software)) is used to generate lexical analyzers.




## Installation

### For Windows Systems:
- Head over to [this link](https://sourceforge.net/projects/gnuwin32/files/flex/2.5.4a-1/flex-2.5.4a-1.exe/download) to download flex.
- Install by double clicking `flex-2.5.4a-1_2.exe` from the downloads folder.
- Add the path: `C:\Program Files (x86)\GnuWin32\bin` in Environment Variables.

### For Linux Systems:

```bash
  sudo apt install flex
```


    
## Example
The file `c_language_analyzer.l` is the lex file which reads input from `check.c` file and analyses it simular to C - language.

```bash
  flex c_language_analyzer.l
  gcc lex.yy.c -o c_language_analyzer
  c_language_analyzer
```

