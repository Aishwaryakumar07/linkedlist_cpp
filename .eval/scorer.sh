#!/bin/bash

user_score=0

if [ -d $1/$7 ]
then
  user_score=`expr $user_score + 1`
  [ -f $1/$2 ] && user_score=`expr $user_score + 1`
  [ -f $1/$3 ] && user_score=`expr $user_score + 1`
  cd $1
  [ `eval git branch -r | wc -l` -ge 1 ] && user_score=`expr $user_score + 1`
  git checkout master > /dev/null 2>&1
  [ `eval git log --pretty="oneline" | wc -l` -ge 1 ] && user_score=`expr $user_score + 1`
  [ `eval git branch -r | grep 'new_branch' | wc -l` -eq 0 ] && user_score=`expr $user_score + 1`
  cd ..

  if [ -d $4/$5 ]
  then
    user_score=`expr $user_score + 1`
    cd $4
    git clone $5 $6 > /dev/null 2>&1
    [ -f $6/$2 ] && user_score=`expr $user_score + 1`
    [ -f $6/$3 ] && user_score=`expr $user_score + 1`
    cd $6
    [ `eval git branch -r | wc -l` -ge 2 ] && user_score=`expr $user_score + 1`
    git checkout master > /dev/null 2>&1
    [ `eval git log --pretty="oneline" | wc -l` -ge 1 ] && user_score=`expr $user_score + 1`
    [ `eval git branch -r | grep 'new_branch' | wc -l` -eq 0 ] && user_score=`expr $user_score + 1`
    cd ../..
    rm -rf $4/$6
  fi
fi

percent_score=$(( user_score * 100 / 12 ))
echo "Points scored: $user_score/12"
echo "FS_SCORE:$percent_score%"
