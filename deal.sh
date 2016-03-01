#!/bin/bash
for filename in *0*;
do
date_line=$(grep -o '^date: 201[0-6]\S*' $filename)
w_id_line=$(grep '^wordpress_id: [0-9]*' $filename)
ARR1=($date_line)
ARR2=($w_id_line)
date_num=${ARR1[1]}
wordp_id=${ARR2[1]}
replace_str='permalink: '/${date_num//-//}/${wordp_id}'.html'
sed -i "/title:/a`echo $replace_str`" $filename
done
