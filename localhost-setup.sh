#!/bin/bash

# run:
# ./localhost-setup.sh add_host localhost portal.cssat.org
# ./localhost-setup.sh add_host localhost viz.portal.cssat.org
# ./localhost-setup.sh remove_host localhost portal.cssat.org
# ./localhost-setup.sh remove_host localhost viz.portal.cssat.org
# ./localhost-setup.sh add_dns_daemon_key 
# ./localhost-setup.sh remove_dns_daemon_key 


# PATH TO YOUR HOSTS FILE
ETC_HOSTS=/etc/hosts
DAEMON_FILE=${HOME%%}/.docker/daemon.json


function remove_host() {
    # IP to add/remove.
    IP=$1
    # Hostname to add/remove.
    HOSTNAME=$2
    HOSTS_LINE="$IP[[:space:]]$HOSTNAME"
    if [ -n "$(ggrep $HOSTS_LINE $ETC_HOSTS)" ]
    then
        echo "$HOSTS_LINE Found in your $ETC_HOSTS, Removing now...";
        sudo sed -i".bak" "/$HOSTS_LINE/d" $ETC_HOSTS
    else
        echo "$HOSTS_LINE was not found in your $ETC_HOSTS";
    fi
}

function add_host() {
    IP=$1
    HOSTNAME=$2
    HOSTS_LINE="$IP[[:space:]]$HOSTNAME"
    line_content=$( printf "%s\t%s\n" "$IP" "$HOSTNAME" )
    if [ -n "$(ggrep -P $HOSTS_LINE $ETC_HOSTS)" ]
        then
            echo "$line_content already exists : $(grep $HOSTNAME $ETC_HOSTS)"
        else
            echo "Adding $line_content to your $ETC_HOSTS";
            sudo -- sh -c -e "echo '$line_content' >> /etc/hosts";

            if [ -n "$(ggrep -P $HOSTNAME $ETC_HOSTS)" ]
                then
                    echo "$line_content was added succesfully";
                else
                    echo "Failed to Add $line_content, Try again!";
            fi
    fi
}

function remove_dns_daemon_key() {

    if [ $(jq 'has("dns")' $DAEMON_FILE) == true]
    then
        echo "dns key found in your $DAEMON_FILE, Removing now...";
        jq 'del(.dns)' $DAEMON_FILE
    else
        echo "dns key was not found in your $DAEMON_FILE";
    fi
}

function add_dns_daemon_key() {


    if [[ $(jq 'has("dns")' $DAEMON_FILE) == true ]]
        then
            echo "dns key already exists with the following values: "
            echo "$(jq '.dns[]' $DAEMON_FILE)"
            echo "Please edit file manually or through Docker Desktop to avoid system corruption."
        else
            echo "Adding dns: [172.20.0.3, 8.8.8.8, 8.8.4.4] to your $DAEMON_FILE";
            printf '%s' "$(jq '. += {"dns": ["172.20.0.03", "8.8.8.8", "8.8.4.4"]}' $DAEMON_FILE)" > $DAEMON_FILE;

            if [[ $(jq 'has("dns")' $DAEMON_FILE) == true ]]
                then
                    echo "dns key was added succesfully";
                else
                    echo "Failed to Add dns key, Try again!";
            fi
    fi
}

$@
