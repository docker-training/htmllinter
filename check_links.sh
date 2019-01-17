#!/bin/bash

for file in $(find /code -name '*.html')
do 
    #echo $file
    for line in $(cat $file)
    do
        if [[ $line == href* ]]
        then
            url=`echo $line | sed -ne 's/.*href="\([^"]*\).*/\1/p'`
            #` | rev | cut -c 3- | rev`
            #echo $url
            if [ -z $url ]
            then
                #echo $line
                url=`echo $line | sed -ne "s/.*href='\([^']*\).*/\1/p"`
                #echo $url
            fi
            status_code=$(curl -o -I -L -s -w "%{http_code}\n" $url)
            #echo $status_code

            if [ $status_code -ge "200" ] && [ $status_code -lt "300" ]
            then
                #echo "status check succeeded"
                :
            else
                echo $file
                echo "broken url:" $url
                echo "---"
            fi
        fi

    done
done 


