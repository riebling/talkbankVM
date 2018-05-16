# talkbankVM

This VM is much like Eesen Transcriber, except that it includes not only Eesen Tedlium models, but Kaldi Aspire models for transcribing speech. 

## Borrowed from [Eesen Transcriber](https://github.com/srvk/eesen-transcriber)
### [Installation Guide](https://github.com/srvk/eesen-transcriber/blob/master/INSTALL.md)
Quickstart instructions:  
clone this git repository with `git clone http://github.com/riebling/talkbankVM`  
a folder `talkbankVM` will be created. cd into this folder then run `vagrant up`  
This will take a *really long* time because it builds both Kaldi and Eesen.  
Data placed in this folder will appear from within the VM as `/vagrant/<data>`  

## New features specific to Talkbank data include:

 * speech2wer.sh - Computes word error rate for audio, scoring against plain text files. INPUTS: WAV (or MP3) audio, text transcript. Optional input: a GLM 'global mapping' file that specifies homonyms to be scored equivalently to their sound-alikes. Suppose you have an audio file named set9.wav, a transcript named set9.stm, and a GLM file named Tony-input.glm, saved in a local folder `Tony-input`. To obtain scores:

```
vagrant up # takes REALLY long because contains Eesen and Kaldi
vagrant ssh # log into the virtual machine
cd bin # the home folder for tools
./speech2wer.sh /vagrant/Tony-input/set9.wav /vagrant/Tony-input/Tony-input.glm
```
Output will appear in build/output/set9.* - here is an example:
```
build/output/set9.dtl
DETAILED OVERALL REPORT FOR THE SYSTEM: build/output/set9.filt.hyp

SENTENCE RECOGNITION PERFORMANCE

 sentences                                           1
 with errors                            100.0%   (   1)

   with substitions                     100.0%   (   1)
   with deletions                         0.0%   (   0)
   with insertions                        0.0%   (   0)


WORD RECOGNITION PERFORMANCE

Percent Total Error       =   66.7%   (   8)

Percent Correct           =   33.3%   (   4)

Percent Substitution      =   66.7%   (   8)
Percent Deletions         =    0.0%   (   0)
Percent Insertions        =    0.0%   (   0)
Percent Word Accuracy     =   33.3%


Ref. words                =           (  12)
Hyp. words                =           (  12)
Aligned words             =           (  12)

CONFUSION PAIRS                  Total                 (8)
                                 With >=  1 occurances (8)

   1:    1  ->  band ==> found
   2:    1  ->  bank ==> banks
   3:    1  ->  damp ==> don't
   4:    1  ->  grand ==> ground
   5:    1  ->  lack ==> work
   6:    1  ->  land ==> and
   7:    1  ->  lend ==> learned
   8:    1  ->  stamp ==> stand
     -------
         8



INSERTIONS                       Total                 (0)
                                 With >=  1 occurances (0)

     -------
         0



DELETIONS                        Total                 (0)
                                 With >=  1 occurances (0)

     -------
         0



SUBSTITUTIONS                    Total                 (8)
                                 With >=  1 occurances (8)

   1:    1  ->  band
   2:    1  ->  bank
   3:    1  ->  damp
   4:    1  ->  grand
   5:    1  ->  lack
   6:    1  ->  land
   7:    1  ->  lend
   8:    1  ->  stamp
     -------
         8


* NOTE: The 'Substitution' words are those reference words
        for which the recognizer supplied an incorrect word.


FALSELY RECOGNIZED               Total                 (8)
                                 With >=  1 occurances (8)

   1:    1  ->  and
   2:    1  ->  banks
   3:    1  ->  don't
   4:    1  ->  found
   5:    1  ->  ground
   6:    1  ->  learned
   7:    1  ->  stand
   8:    1  ->  work
     -------
         8


* NOTE: The 'Falsely Recognized' words are those hypothesis words
        which the recognizer incorrectly substituted for a reference word.

build/output/set9.filt.hyp
SEND DON'T WORK BANKS STAND LAMP AND FOUND BEND LEARNED DANCE GROUND
build/output/set9.prf
NIST_TEXT_ALIGNMENT
VERSION 0.1


        DUMP OF SYSTEM ALIGNMENT STRUCTURE

System name:   build/output/set9.filt.hyp
Ref file:      /vagrant/Tony-input/set9.stm
Hyp file:      build/output/set9.filt.hyp
Creation date: "Thu Apr 19 20:00:05 2018"
Fragment Correct Flag Set

Speaker Count: 1
Speakers:
    0: 


Speaker sentences   0:     utt# 0 of 1
id:
Scores: (#C #S #D #I) 4 8 0 0
REF:  send DAMP  LACK BANK  STAMP lamp LAND BAND  bend LEND    dance GRAND 
HYP:  send DON'T WORK BANKS STAND lamp AND  FOUND bend LEARNED dance GROUND
Eval:      S     S    S     S          S    S          S             S     


build/output/set9.raw



                     SYSTEM SUMMARY PERCENTAGES by SPEAKER                     

        ,--------------------------------------------------------------.
        |                  build/output/set9.filt.hyp                  |
        |--------------------------------------------------------------|
        | SPKR | # Snt # Wrd | Corr    Sub    Del    Ins    Err  S.Err |
        |------+-------------+-----------------------------------------|
        |      |    1     12 |    4      8      0      0      8      1 |
        |==============================================================|
        | Sum  |    1     12 |    4      8      0      0      8      1 |
        |==============================================================|
        | Mean |  1.0   12.0 |  4.0    8.0    0.0    0.0    8.0    1.0 |
        | S.D. |  0.0    0.0 |  0.0    0.0    0.0    0.0    0.0    0.0 |
        |Median|  1.0   12.0 |  4.0    8.0    0.0    0.0    8.0    1.0 |
        `--------------------------------------------------------------'
build/output/set9.sys



                     SYSTEM SUMMARY PERCENTAGES by SPEAKER                     

       ,----------------------------------------------------------------.
       |                   build/output/set9.filt.hyp                   |
       |----------------------------------------------------------------|
       | SPKR   | # Snt # Wrd | Corr    Sub    Del    Ins    Err  S.Err |
       |--------+-------------+-----------------------------------------|
       |        |    1     12 | 33.3   66.7    0.0    0.0   66.7  100.0 |
       |================================================================|
       | Sum/Avg|    1     12 | 33.3   66.7    0.0    0.0   66.7  100.0 |
       |================================================================|
       |  Mean  |  1.0   12.0 | 33.3   66.7    0.0    0.0   66.7  100.0 |
       |  S.D.  |  0.0    0.0 |  0.0    0.0    0.0    0.0    0.0    0.0 |
       | Median |  1.0   12.0 | 33.3   66.7    0.0    0.0   66.7  100.0 |
       `----------------------------------------------------------------'
```

You can optionally run without a GLM file.  
By default this uses the Aspire model; you can see in the file `speech2wer.sh` this section, `segments` and `models` are selected. To switch to Tedlium+Eesen models, comment out the Aspire + Kaldi ones, and uncomment the Tedlium + Eesen ones.
```
# Tedlium + Eesen
#segments=show.seg
#models=tedlium.eesen
# Swbd8K + Eesen
#segments=show.s.seg
#models=swbd.8k
# Aspire + Kald
segments=show.seg
models=aspire.kaldi
```
 * speech2per.sh - computes phone error rate  
 ```
vagrant ssh
cd bin
./speech2per.sh /vagrant/test2.txt /vagrant/test2.mp3
```
 This produces many files, all in `build/output`:
 ```
vagrant@vagrant:~/bin$ ls build/output
speech2per.log  test2.ctm  test2.dtl  test2.labels  test2.phon.stm  test2.phon.sys  test2.sbv  test2.srt  test2.trs  test2.txt
```
 speech2per.log:
 ```
test2 %PER 13.99 [ 20 / 143, 6 ins, 5 del, 9 sub ]
```
 test2.phon.sys:
 ```
UTTERANCE TH IH NG Z W IH L CH EY N JH IH N W EY Z DH AE T DH EH R F R AE JH AH L IH N V AY R AH N M AH N T S IH M P L IY K AE N T S AH P AO R T  AH N D DH AE T L IY D Z T UW S T AA R V EY SH AH N IH T L IY D Z T UW AH N S ER T AH N T IY IH T L IY D Z T UW AH N R EH S T  S OW DH AH DH AH K L AY M AH T CH EY N JH AH Z W IH L B IY T EH R AH B AH L F AO R DH EH M
```

 * speech2phones.sh - phonetic transcription (output translated to IPA) run in a similar way to above, produces `build/output/test2.phones`:
 ```
test2-S0---0000.070-0006.460 θ ɪ ŋ z w ɪ ɫ tʃ eɪ n dʒ ɪ m w eɪ z ð ʌ t ð ɛ r f r æ dʒ ʌ ɫ ɪ n v aɪ r ʌ n m ʌ n t s ɪ m p ɫ i k æ n t s ʌ p ɔ r t 
test2-S1---0006.460-0009.340 ʌ n d ð ʌ t ɫ i d z u s ɑ r v eɪ ʃ ʌ n ð ɪ t ɫ i d z d u ʌ n s ɝ t ʌ n t i æ t ɫ i d z 
test2-S2---0009.340-0014.340 s t ʌ n r ɛ s p t ɫ s oʊ ʌ t ð i k ɫ aɪ m ɪ t tʃ eɪ n dʒ ɪ z w ɪ ɫ b i t eɪ r ʌ b ʌ ɫ f r ɝ ð ɛ m
```

 * speech2phonectm.sh - phonetic transcription with phone onset timings produces `build/output/test2.phon.ctm`:
 ```
test2 S0   0000.070 0006.460 S0 θ 0.48 0.06
test2 S0   0000.070 0006.460 S0 ɪ 0.54 0.06
test2 S0   0000.070 0006.460 S0 ŋ 0.6 0.06
test2 S0   0000.070 0006.460 S0 z 0.72 0.06
test2 S0   0000.070 0006.460 S0 w 0.81 0.06
test2 S0   0000.070 0006.460 S0 ɪ 0.87 0.03
test2 S0   0000.070 0006.460 S0 ɫ 0.9 0.06
test2 S0   0000.070 0006.460 S0 tʃ 1.02 0.09
test2 S0   0000.070 0006.460 S0 eɪ 1.14 0.06
test2 S0   0000.070 0006.460 S0 n 1.29 0.06
test2 S0   0000.070 0006.460 S0 dʒ 1.38 0.09
test2 S0   0000.070 0006.460 S0 ɪ 1.5 0.03
test2 S0   0000.070 0006.460 S0 m 1.53 0.03
test2 S0   0000.070 0006.460 S0 w 1.62 0.06
test2 S0   0000.070 0006.460 S0 eɪ 1.71 0.03
test2 S0   0000.070 0006.460 S0 z 1.98 0.06
test2 S0   0000.070 0006.460 S0 ð 2.46 0.06
test2 S0   0000.070 0006.460 S0 ʌ 2.52 0.03
test2 S0   0000.070 0006.460 S0 t 2.55 0.06
test2 S0   0000.070 0006.460 S0 ð 2.64 0.06
test2 S0   0000.070 0006.460 S0 ɛ 2.7 0.03
test2 S0   0000.070 0006.460 S0 r 2.73 0.06
test2 S0   0000.070 0006.460 S0 f 2.91 0.03
test2 S0   0000.070 0006.460 S0 r 2.97 0.09
test2 S0   0000.070 0006.460 S0 æ 3.06 0.06
test2 S0   0000.070 0006.460 S0 dʒ 3.24 0.06
test2 S0   0000.070 0006.460 S0 ʌ 3.33 0.06
test2 S0   0000.070 0006.460 S0 ɫ 3.39 0.09
test2 S0   0000.070 0006.460 S0 ɪ 3.48 0.03
test2 S0   0000.070 0006.460 S0 n 3.51 0.09
test2 S0   0000.070 0006.460 S0 v 3.66 0.06
test2 S0   0000.070 0006.460 S0 aɪ 3.72 0.06
test2 S0   0000.070 0006.460 S0 r 3.78 0.12
test2 S0   0000.070 0006.460 S0 ʌ 3.9 0.03
test2 S0   0000.070 0006.460 S0 n 3.93 0.06
test2 S0   0000.070 0006.460 S0 m 3.99 0.06
test2 S0   0000.070 0006.460 S0 ʌ 4.05 0.03
test2 S0   0000.070 0006.460 S0 n 4.08 0.06
test2 S0   0000.070 0006.460 S0 t 4.14 0.06
test2 S0   0000.070 0006.460 S0 s 4.47 0.06
test2 S0   0000.070 0006.460 S0 ɪ 4.53 0.06
test2 S0   0000.070 0006.460 S0 m 4.59 0.06
test2 S0   0000.070 0006.460 S0 p 4.65 0.03
test2 S0   0000.070 0006.460 S0 ɫ 4.71 0.09
test2 S0   0000.070 0006.460 S0 i 4.8 0.06
test2 S0   0000.070 0006.460 S0 k 4.92 0.03
test2 S0   0000.070 0006.460 S0 æ 5.04 0.03
test2 S0   0000.070 0006.460 S0 n 5.1 0.06
test2 S0   0000.070 0006.460 S0 t 5.16 0.09
test2 S0   0000.070 0006.460 S0 s 5.28 0.06
test2 S0   0000.070 0006.460 S0 ʌ 5.37 0.03
test2 S0   0000.070 0006.460 S0 p 5.46 0.03
test2 S0   0000.070 0006.460 S0 ɔ 5.55 0.06
test2 S0   0000.070 0006.460 S0 r 5.61 0.12
test2 S0   0000.070 0006.460 S0 t 5.79 0.06
test2 S1   0006.460 0009.340 S1 ʌ 0.06 0.03
test2 S1   0006.460 0009.340 S1 n 0.09 0.03
test2 S1   0006.460 0009.340 S1 d 0.12 0.06
test2 S1   0006.460 0009.340 S1 ð 0.18 0.03
test2 S1   0006.460 0009.340 S1 ʌ 0.21 0.06
test2 S1   0006.460 0009.340 S1 t 0.27 0.06
test2 S1   0006.460 0009.340 S1 ɫ 0.36 0.06
test2 S1   0006.460 0009.340 S1 i 0.42 0.03
test2 S1   0006.460 0009.340 S1 d 0.48 0.09
test2 S1   0006.460 0009.340 S1 z 0.57 0.06
test2 S1   0006.460 0009.340 S1 u 0.63 0.06
test2 S1   0006.460 0009.340 S1 s 0.75 0.06
test2 S1   0006.460 0009.340 S1 ɑ 0.84 0.03
test2 S1   0006.460 0009.340 S1 r 0.87 0.06
test2 S1   0006.460 0009.340 S1 v 0.99 0.03
test2 S1   0006.460 0009.340 S1 eɪ 1.05 0.06
test2 S1   0006.460 0009.340 S1 ʃ 1.2 0.06
test2 S1   0006.460 0009.340 S1 ʌ 1.32 0.03
test2 S1   0006.460 0009.340 S1 n 1.35 0.06
test2 S1   0006.460 0009.340 S1 ð 1.44 0.03
test2 S1   0006.460 0009.340 S1 ɪ 1.47 0.03
test2 S1   0006.460 0009.340 S1 t 1.5 0.06
test2 S1   0006.460 0009.340 S1 ɫ 1.59 0.06
test2 S1   0006.460 0009.340 S1 i 1.65 0.03
test2 S1   0006.460 0009.340 S1 d 1.71 0.06
test2 S1   0006.460 0009.340 S1 z 1.77 0.06
test2 S1   0006.460 0009.340 S1 d 1.86 0.03
test2 S1   0006.460 0009.340 S1 u 1.89 0.03
test2 S1   0006.460 0009.340 S1 ʌ 1.92 0.03
test2 S1   0006.460 0009.340 S1 n 1.98 0.06
test2 S1   0006.460 0009.340 S1 s 2.13 0.06
test2 S1   0006.460 0009.340 S1 ɝ 2.19 0.03
test2 S1   0006.460 0009.340 S1 t 2.25 0.06
test2 S1   0006.460 0009.340 S1 ʌ 2.31 0.03
test2 S1   0006.460 0009.340 S1 n 2.34 0.06
test2 S1   0006.460 0009.340 S1 t 2.43 0.03
test2 S1   0006.460 0009.340 S1 i 2.46 0.06
test2 S1   0006.460 0009.340 S1 æ 2.55 0.03
test2 S1   0006.460 0009.340 S1 t 2.58 0.09
test2 S1   0006.460 0009.340 S1 ɫ 2.67 0.06
test2 S1   0006.460 0009.340 S1 i 2.73 0.06
test2 S1   0006.460 0009.340 S1 d 2.79 0.06
test2 S2   0009.340 0014.340 S2 z 0.0 0.0
test2 S2   0009.340 0014.340 S2 [UM] 0.03 0.06
test2 S2   0009.340 0014.340 S2 s 0.09 0.03
test2 S2   0009.340 0014.340 S2 t 0.12 0.03
test2 S2   0009.340 0014.340 S2 ʌ 0.15 0.03
test2 S2   0009.340 0014.340 S2 n 0.21 0.06
test2 S2   0009.340 0014.340 S2 r 0.33 0.06
test2 S2   0009.340 0014.340 S2 ɛ 0.45 0.03
test2 S2   0009.340 0014.340 S2 s 0.57 0.06
test2 S2   0009.340 0014.340 S2 p 0.66 0.03
test2 S2   0009.340 0014.340 S2 t 0.69 0.06
test2 S2   0009.340 0014.340 S2 ɫ 1.47 0.06
test2 S2   0009.340 0014.340 S2 s 1.53 0.09
test2 S2   0009.340 0014.340 S2 oʊ 1.62 0.03
test2 S2   0009.340 0014.340 S2 ʌ 1.74 0.03
test2 S2   0009.340 0014.340 S2 t 1.8 0.03
test2 S2   0009.340 0014.340 S2 ð 1.95 0.03
test2 S2   0009.340 0014.340 S2 i 1.98 0.06
test2 S2   0009.340 0014.340 S2 k 2.13 0.03
test2 S2   0009.340 0014.340 S2 ɫ 2.19 0.06
test2 S2   0009.340 0014.340 S2 aɪ 2.28 0.03
test2 S2   0009.340 0014.340 S2 m 2.37 0.06
test2 S2   0009.340 0014.340 S2 ɪ 2.46 0.03
test2 S2   0009.340 0014.340 S2 t 2.49 0.06
test2 S2   0009.340 0014.340 S2 tʃ 2.58 0.06
test2 S2   0009.340 0014.340 S2 eɪ 2.67 0.03
test2 S2   0009.340 0014.340 S2 n 2.76 0.06
test2 S2   0009.340 0014.340 S2 dʒ 2.82 0.06
test2 S2   0009.340 0014.340 S2 ɪ 2.94 0.03
test2 S2   0009.340 0014.340 S2 z 3.0 0.06
test2 S2   0009.340 0014.340 S2 w 3.21 0.06
test2 S2   0009.340 0014.340 S2 ɪ 3.27 0.06
test2 S2   0009.340 0014.340 S2 ɫ 3.33 0.06
test2 S2   0009.340 0014.340 S2 b 3.39 0.06
test2 S2   0009.340 0014.340 S2 i 3.45 0.03
test2 S2   0009.340 0014.340 S2 t 3.57 0.03
test2 S2   0009.340 0014.340 S2 eɪ 3.66 0.03
test2 S2   0009.340 0014.340 S2 r 3.69 0.09
test2 S2   0009.340 0014.340 S2 ʌ 3.78 0.03
test2 S2   0009.340 0014.340 S2 b 3.81 0.06
test2 S2   0009.340 0014.340 S2 ɫ 3.9 0.06
test2 S2   0009.340 0014.340 S2 f 3.96 0.06
test2 S2   0009.340 0014.340 S2 r 4.02 0.03
test2 S2   0009.340 0014.340 S2 ɝ 4.05 0.06
test2 S2   0009.340 0014.340 S2 ð 4.11 0.09
test2 S2   0009.340 0014.340 S2 ɛ 4.2 0.03
test2 S2   0009.340 0014.340 S2 m 4.32 0.06
```
 
### [User Guide](https://github.com/srvk/eesen-transcriber/blob/master/USERGUIDE.md)

## License

The Eesen software has been released under an Apache 2.0 license, the LIUM speaker diarization is GPL, but LIUM offers to work with you if that is too strict [LIUM license](http://www-lium.univ-lemans.fr/diarization/doku.php/licence). The Eesen transcriber uses and expands the Kaldi offline transcriber, which has been released under a very liberal license at [Kaldi Offline Transcriber license](https://github.com/alumae/kaldi-offline-transcriber/blob/master/LICENSE). The transcriber uses various other tools such as Atlas, Sox, FFMPEG that are being released as Ubuntu packages. Some of these have their own licenses, if one of them poses a problem, it would not be too hard to remove them specifically.

## Sponsors

Thanks to NVidia for their [Academic GPU Grant](https://developer.nvidia.com/academic_gpu_seeding)
