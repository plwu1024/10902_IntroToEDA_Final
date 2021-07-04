make

testlist=(test1 test2 ezpz01 ezpz02 tim1 tim2 tim3 tim4)
for test in "${testlist[@]}"
do
  echo 
  echo $test
  cp -f tests/$test/g1.v tests/$test/r2.v .
  ./abc -f abc_script
  cp -f g1_t.v out.v patch.v tests/$test/
  rm -f g1.v r2.v g1_t.v out.v patch.v
done
