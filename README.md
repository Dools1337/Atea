# Atea SD Scripts

A small collection of script designed to make life easier when dealing with everyday SD tasks. 

## Getting Started

Download or copy/paste the raw file into a .txt some of them should be ran on-premises. (As I avoided using invoke-cmd to avoid permissions problems)
You can also navigate to the path and run it from there : .\yourscript.ps1

Most of them requires admin privilege, some will include a self-elevating script as well if necessary.

### Prerequisites

- Powershell 2.0 - 7.0 (installed by default on all Atea Windows Image) 

- ActiveDirectory Module in some cases (not available for P$ 7 yet)

- RSAT Module/Exchange Module


#### Description of each scripts 

* Copy/Paste - 

```
Nothing fancy just copy AD Groups to one user to another with a prompt
```

* Terminationfinland @ Atea

```
Enter username of user 
Enter ACCOUNT CASE as in CSMS case
Enter Month of Termination

It will : 
 - Add the case number to the notes (add a line not remove everything)
 - Remove all groups from the user
 - Add necessary group for terminated user
 - Move the user into the correct folder related to the month (USERS DISABLED\MONTH)
 - Disable the account
 
 ```
 * TerminationLOG @ Atea
 
 Same principle as for Finland, user is moved to "Users disabled" OU since you won't need to specify the month.
 
 * Flushteam 
 
Just copy/paste into your favorite notepad editor/atom/sublime/visualcode
and run it. 

Save it somewhere, double click on it / Navigate to that path and run .\flush.ps1 

Alternatively copy/paste this into a powershell window : 
```
iex ((New-Object System.Net.WebClient).DownloadString('https://git.io/JeWxX'))
```

Clearing those locations + self elevating command.

%AppData%\Microsoft\teams\application cache\cache

%AppData%\Microsoft\teams\blob_storage

%AppData%\Microsoft\teams\databases

%AppData%\Microsoft\teams\cache

%AppData%\Microsoft\teams\gpucache

%AppData%\Microsoft\teams\Indexeddb

%AppData%\Microsoft\teams\Local Storage

%AppData%\Microsoft\teams\tmp

%LocalAppData%\Google\Chrome\User Data\Default\Cache

%LocalAppData%\Google\Chrome\User Data\Default\Cookies

%LocalAppData%\Google\Chrome\User Data\Default\Web Data

Internet Explorer Temporary Internet Files

Internet Explorer Cookies

* Delete Skype Cache

Will do exactly that + kill lync & skype process.

* Litigation Hold UI

Complete UI in powershell to handle litigation hold. 
Exchange connection within the script is currently broken
Just connect with your own connector and you should be fine (or run it on premises)



## Authors

* Timour Varrasse @ Atea Global Service
* Hemmo Konturi (formating some stuff and being generally super helpful)
* Eyal Doron (Most of the Litigation Hold UI)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
