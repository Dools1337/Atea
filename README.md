# Atea SD Scripts

A small collection of script designed to make my life easier when dealing with everyday SD tasks. 

## Getting Started

Download or copy/paste the raw file into a .txt some of them should be ran on-premises. (As I avoided using invoke-cmd to avoid permissions problems)
You can also navigate to the path and run it from there : .\yourscript.ps1

Most of them requires admin privilege, some will include a self-elevating script as well if necessary.

### Prerequisites

- Powershell 2.0 - 7.0 (installed by default on all Atea Windows Image) 

- ActiveDirectory Module in some cases (not available for P$ 7 yet)

- RSAT Module/Exchange Module


#### Description of each scripts 

Copy/Paste - 

```
Nothing fancy just copy AD Groups to one user to another with a prompt
```

Terminationfinland 

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


## Authors

Timour Varrasse @ Atea Global Service
Hemmo Konturi (formating some stuff and being generally super helpful)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
