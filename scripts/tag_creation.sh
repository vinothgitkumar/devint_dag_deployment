#!/bin/bash
version_increament=0.1
#current_tag=`git tag | tail -n1`
current_tag=`git tag --sort version:refname | tail -n1`
vertion_tag=`$current_tag + $version_increament`
echo "$vertion_tag" >> $GITHUB_ENV
#echo "::set-output name=TAG_NAME::$vertion_tag"
#echo "::set-output name=TAG_NAME::$((git tag --sort version:refname | tail -n1)+(0.1)"
git push origin staging --tags
git checkout -b production $vertion_tag