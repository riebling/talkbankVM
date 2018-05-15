# talkbankVM

This VM is much like Eesen Transcriber, except that it includes not only Eesen Tedlium models, but Kaldi Aspire models for transcribing speech. New features specific to Talkbank data include:

 * speech2wer.sh - Computes word error rate for audio, scoring against plain text files. INPUTS: WAV (or MP3) audio, text transcript. Optional input: a GLM 'global mapping' file that specifies homonyms to be scored equivalently to their sound-alikes. Suppose you have an audio file named set9.wav, a transcript named set9.stm, and a GLM file named Tony-input.glm, saved in a local folder `Tony-input`. To obtain scores:

```
vagrant up # takes REALLY long because contains Eesen and Kaldi
vagrant ssh # log into the virtual machine
cd bin # the home folder for tools
./speech2wer.sh /vagrant/Tony-input/set9.wav /vagrant/Tony-input/Tony-input.glm
```
Output will appear in build/output/set9.*

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

## Borrowed from [Eesen Transcriber](https://github.com/srvk/eesen-transcriber)
### [Installation Guide](https://github.com/srvk/eesen-transcriber/blob/master/INSTALL.md)
Quickstart instructions:  
clone this git repository with `git clone http://github.com/riebling/talkbankVM`  
a folder `talkbankVM` will be created. cd into this folder then run `vagrant up`  
This will take a *really long* time because it builds both Kaldi and Eesen.  
Data placed in this folder will appear from within the VM as `/vagrant/<data>`  

### [User Guide](https://github.com/srvk/eesen-transcriber/blob/master/USERGUIDE.md)

## License

The Eesen software has been released under an Apache 2.0 license, the LIUM speaker diarization is GPL, but LIUM offers to work with you if that is too strict [LIUM license](http://www-lium.univ-lemans.fr/diarization/doku.php/licence). The Eesen transcriber uses and expands the Kaldi offline transcriber, which has been released under a very liberal license at [Kaldi Offline Transcriber license](https://github.com/alumae/kaldi-offline-transcriber/blob/master/LICENSE). The transcriber uses various other tools such as Atlas, Sox, FFMPEG that are being released as Ubuntu packages. Some of these have their own licenses, if one of them poses a problem, it would not be too hard to remove them specifically.

## Sponsors

Thanks to NVidia for their [Academic GPU Grant](https://developer.nvidia.com/academic_gpu_seeding)
