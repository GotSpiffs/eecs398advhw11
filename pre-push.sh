
echo "RUNNING REGRESSION TESTS"

make prog

num_succeded=0
num_failed=0

for test in test*.cpp; do
	base=${test%.*}

	make $base
	./$base

	ret=$?
	if [[ ret -eq 0 ]]; then
		echo "Test $base passed"
		((num_succeded += 1))

	else
		echo "Test $base failed"
		((num_failed += 1))

	fi

done


echo "Num Tests Succeded: $num_succeded"
echo "Num Tests Failed: $num_failed"

exit $num_failed
