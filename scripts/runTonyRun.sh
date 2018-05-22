# run baseline WER computation

#rm build/output/*.log

for f in /vagrant/Tony-input/*.wav; do
    ./speech2wer.sh $f >& /dev/null 2>&1;
done;

#./score.sh build/output/*.log

#echo "        | SPKR | # Snt # Wrd | Corr    Sub    Del    Ins    Err  S.Err |" >build/output/score.txt
rm -f build/output/score.txt
touch build/output/score.txt
for f in build/output/*.raw; do
    echo $f " " `grep Sum $f` >>build/output/score.txt
done

cat build/output/score.txt | awk '{count = count + 12; ins = ins + $11; del = del + $10; subs = subs + $9; err = err + $12} END {print "count: " count " WER: " err * 100 / count " ins: " ins " del: " del " sub: " subs }'
