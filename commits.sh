echo "Enter the year"
read year

echo "Enter the month"
read month

for Y in $year
do
  for M in $month
  do
    for D in {01..31}
    do
      for i in $(seq 1 $(( ( RANDOM % 59 )  + 1 )))
      do
        export GIT_COMMITTER_DATE="$Y-$M-$D 12:$i:00"
        export GIT_AUTHOR_DATE="$Y-$M-$D 12:$i:00"
        git commit --allow-empty -m "$i on $M $D $Y"
      done
    done
  done
done
git push origin main