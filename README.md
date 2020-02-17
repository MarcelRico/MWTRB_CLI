# MWTRB_CLI

Welcome to Merriam Webster's Thesaurus CLI (MWTRB_CLI) gem! This gem has been created to allow you to search words in Merriam Webster's Thesaurus by use of their API. When searching a word, there are four different pieces of information that the CLI will display in relation to your word: Definiton, Synonyms, Antonyms, and Examples of word usage.

## Getting Started
These instructions will 

## Prerequisites
Before using this Gem, be sure to register for a Thesaurus API key at: [dictionaryapi.com](https://dictionaryapi.com/register/index). 

Then clone this repository with SSH to get started:

```
git clone git@github.com:MarcelRico/MWTRB_CLI.git
```

## Installing
After cloning the repository navigate to the the following file: MWTRB_CLI/lib/API.rb. and then update the key value with your new api key that you received when registering at [dictionaryapi.com](https://dictionaryapi.com/register/index).

```ruby
@@api_key = "API_KEY"
```

Next in terminal shell navigate to MWTRB_CLI/bin

```
cd /MWTRB_CLI/bin
```

 run the following command to add execution permissions to the exec file

```
chmod +x exec
```

Lastly to ensure that all is working correctly after you have added your API_Key in the API class,
and added exectution permissions to the exec file, attempt to run the execution file in your terminal shell as shown below (Note: You must be in the bin folder, to run it this way):

```
./exec
```

If the program starts with the following screen, you have successfully installed, and are running MWTRB_CLI:

```
Welcome to MWRB-CLI
Note: All data supplied by Merriam Websters Thesaurus API
==========================================================

Please enter the word to lookup:
```

Authors
Marcel Rico

License
This project is licensed under the MIT License - see the LICENSE.md file for details

Acknowledgments
Kudos and a big thanks to the Michal Kalbarczyk for his amazing Colorize Gem which
allowed me to add the awesome color scheme to this CLI project. Thanks Michal