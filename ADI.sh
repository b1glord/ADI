#!/bin/sh
clear
echo ""
echo "Welcome to the Hercules/rAthena database installer"
echo "This script will install your database for you, without you having to do it manually."
#echo ""
#echo "This script was created by BigLorD of TitanRO (http://www.titanro.net) for the Hercules and rAthena community."
echo ""
echo ""

# Ask user fror the MySQL username
# Then check if the username field is blank
# if blank it will error out
read -p "Please enter your MySQL username: " username
if [[ -z "$username" ]]; then
        echo "ERROR: That username is invalid or you didn't enter a value."
        exit
        # If username is valid or field is not blank continue and ask for the password
elif [[ -n "$username" ]]; then
        read -sp "Please enter your MySQL Password: " password
fi

# This checks if the password is valid and the field is not blank.
# Also checks if the confirmation password is valid and not blank.
# Then checks and compares the two passwords.
# If one password is typed incorrectly it will error out.
if [[ -z "$password" ]]; then
        echo ""
        echo "ERROR: That password is invalid or you didn't enter a value."
        exit
        # Password is valid.
elif [[ -n "$password" ]]; then
        echo ""
        read -sp "Please re-enter your MySQL Password: " password2
        # Confirmation Password is invalid.
        if [[ -z "$password2" ]]; then
                echo ""
                echo "ERROR: The second password entered was invalid or you didn't enter a value."
                exit
        fi
fi

# Password comparing
if [[ -n "$password2" ]] && [[ "$password" == "$password2" ]]; then
        echo ""
        echo ""
        echo "Passwords match continuing..."
        echo ""
        read -p "Please provide us your hostname for MySQL (default is localhost): " hostname

        # Checks if Passwords do not match
elif [[ -n "$password2" ]] && [[ "$password" != "$password2" ]]; then
        echo ""
        echo ""
        echo "ERROR: Passwords do not match."
        exit
fi

# Ask what hostname this can be executed locally, but localhost is default.
if [[ -z "$hostname" ]]; then
        echo ""
        echo "ERROR: Please set a proper hostname such as localhost."
        exit

        # If hostname is not blank, we will continue.
elif [[ -n "$hostname" ]]; then
        read -p "Please enter your Ragnarok MySQL database: " database
fi

# If database field is blank, it will error out.
if [[ -z "$database" ]]; then
        echo ""
        echo "ERROR: The database name is invalid or blank."
        exit
        # This portion checks if user is going to use a seperate database for logs if not it will continue with the installation of the database.
elif [[ -n "$database" ]]; then
        read -p "Are you going to use a seperate database for logs? (y/N) " logcheck
fi

# This makes sure Y or n is entered.
if [[ -z "$logcheck" ]] && [[ "$logcheck" != "y" ]] && [[ "$logcheck" != "N" ]];  then
        echo ""
        echo "ERROR: You did not enter y or N."
        exit
        # If users enter n.
elif [[ "$logcheck" == "N" ]]; then
        # Inserting logs into database before anything else
        echo "Inserting logs.sql.."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/logs.sql
        echo "Done."
        read -p "Are you going to use pre-re or re? (Please enter either 're' or 'pre-re')  " base

        # If users enters y.
elif [[ "$logcheck" == "y" ]]; then
        read -p "Please enter your log database name: " logdb

        # Check to make sure logdb is not a empty value.
        if [[ -z "$logdb" ]]; then
                echo ""
                echo "You did not enter a log database name."
                exit

                # logDB is not empty value.
        elif [[ -n "$logdb" ]]; then
                # Inserting SQL file into logDB.
                echo "Inserting logs.sql.."
                mysql -u "$username" -h"$hostname" -p"$password" "$logdb" < sql-files/logs.sql
                echo "Done."

                # Then ask user for pre-re or re.
                read -p "Are you going to use pre-re or re? (Please enter either 're' or 'pre-re') " base

        fi
fi

# User didn't enter 'pre-re' or 're'
if [[ "$base" != "pre-re" ]] && [[ "$base" != "re" ]]; then
        echo "ERROR: You didn't enter 're' or 'pre-re'"
        exit
fi

# Base = renewal
if [[ "$base" == "re" ]]; then
        echo ""
        echo "Lets get started.."
        echo ""
        echo "Inserting main.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/main.sql
        echo "Done inserting main.sql..."
        echo ""
        echo "Inserting item_db.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/item_db.sql
        echo "Done inserting item_db.sql."
        echo ""
        echo "Inserting item_db2.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/item_db2.sql
        echo "Done inserting item_db2.sql."
        echo ""
        echo "Inserting mob_db.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/mob_db.sql
        echo "Done inserting mob_db.sql."
        echo ""
        echo "Inserting mob_db2.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/mob_db2.sql
        echo "Done inserting mob_db2.sql."
        echo ""
        echo "Inserting mob_skill_db.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/mob_skill_db.sql
        echo "Done inserting mob_skill_db.sql."
        echo ""
        echo "Inserting mob_skill_db2.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/mob_skill_db2.sql
        echo "Done inserting mob_skill_db2.sql."
        echo ""
        echo "Inserting item_db_re.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/item_db_re.sql
        echo "Done inserting item_db_re.sql."
        echo ""
        echo "Inserting item_db2_re.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/item_db2_re.sql
        echo "Done inserting item_db2_re.sql."
        #echo ""
        echo "Inserting mob_db_re.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/mob_db_re.sql
        echo "Done inserting mob_db_re.sql."
        echo ""
        echo "Inserting mob_skill_db_re.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/mob_skill_db_re.sql
        echo "Done inserting mob_skill_db_re.sql..."
        echo ""
        echo "Inserting item_cash_db.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/item_cash_db.sql
        echo "Done inserting item_cash_db.sql."
        echo ""
        echo "Inserting item_cash_db2.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/item_cash_db2.sql
        echo "Done inserting item_cash_db2.sql."
        echo ""
        echo "Inserting mob_db_re.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/mob_db_re.sql
        echo "Done inserting mob_db_re.sql."
        echo ""
        echo "Inserting mob_db2_re.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/mob_db2_re.sql
        echo "Done inserting mob_db2_re.sql."
        echo ""
        echo "Inserting mob_skill_db_re.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/mob_skill_db_re.sql
        echo "Done inserting mob_skill_db_re.sql."
        echo ""
        echo "Inserting mob_skill_db2_re.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/mob_skill_db2_re.sql
        echo "Done inserting mob_skill_db2_re.sql."
        echo ""
        echo "Inserting roulette_default_data.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/roulette_default_data.sql
        echo "Done inserting roulette_default_data.sql."
        echo ""
        echo "customaccount.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < customaccount.sql
        echo "Done inserting customaccount.sql."
        echo ""
        echo "custom.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < custom.sql
        echo "Done inserting custom.sql."
        echo ""
        echo "Finished inserting all renewal database sql files."
fi

# Base = 'pre-re'
if [[ "$base" == "pre-re" ]]; then
        echo ""
        echo "Let's get started..."
        echo ""
        echo "Inserting main.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/main.sql
        echo "Done inserting main.sql.."
        echo ""
        echo "Inserting item_db.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/item_db.sql
        echo "Done inserting item_db.sql."
        echo ""
        echo "Inserting item_db2.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/item_db2.sql
        echo "Done inserting item_db2.sql."
        echo ""
        echo "Inserting mob_db.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/mob_db.sql
        echo "Done inserting mob_db.sql."
        echo ""
        echo "Inserting mob_db2.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/mob_db2.sql
        echo "Done inserting mob_db2.sql."
        echo ""
        echo "Inserting mob_skill_db.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/mob_skill_db.sql
        echo "Done inserting mob_skill_db.sql."
        echo ""
        echo "Inserting mob_skill_db2.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < sql-files/mob_skill_db2.sql
        echo "Done inserting mob_skill_db2.sql."
        echo ""
        echo "customaccount.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < customaccount.sql
        echo "Done inserting customaccount.sql."
        echo ""
        echo "custom.sql..."
        mysql -u "$username" -h"$hostname" -p"$password" "$database" < custom.sql
        echo "Done inserting custom.sql."
        echo ""
        echo "Finished inserting all pre-renewal database sql files."
fi
