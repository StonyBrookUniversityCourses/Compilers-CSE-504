rm -rf erroutputs
mkdir erroutputs
cd errtest
for OUTPUT in $(ls in*)
do
	echo  "Processing file $OUTPUT ${OUTPUT/in/err}"
	../demo $OUTPUT >  ../erroutputs/${OUTPUT/in/out} 2> ../erroutputs/${OUTPUT/in/err}
done
cd .. 
for OUTPUT in $(ls erroutputs/err*)
do
	echo "Processing error file $OUTPUT"
	diff ${OUTPUT/erroutputs/errtest} $OUTPUT
done

for OUTPUT in $(ls erroutputs/out*)
do
        echo "Processing output file $OUTPUT"
	diff ${OUTPUT/erroutputs/errtest} $OUTPUT
done


