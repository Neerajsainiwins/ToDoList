# To-do list app

## Folder structure
- Frontend
- Backend
- Database
- Video

### These are the steps for running frontend project

#### Getting Started with Create React App
This project was ReactSemantic-UI with Create React App.

## Available Scripts

Required Node Version :
```sh
 v17.0.0
```


Run command to install node module :
```sh
 npm install
```

In the project directory, you can run:
```sh
 npm run start-dev
```
Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

```sh
npm run start-qa
```
Runs the app in the qa mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

```sh
npm run start-pro
```

Runs the app in the production mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

```sh
npm run build-qa
```
Builds the app for qa to the `build` folder.
It correctly bundles React in qa mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about deployment for more information.

```sh
npm run build-pro
```

Builds the app for production to the `build` folder.
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

This is the url for testing frontend of `Todo-list app`
```sh
http://92.204.135.120:9091/
```


# These are the steps for running backend

Todo list is a .net web api project created in .net core 3.1

### Requirements
- SQL Server 2019
- .Net core 3.1

### Steps for setting up database
- download script files from the database folder
- create `Todo list` empty database in the sql server. 
- run two downloaded files in the same database query window

Once script files are executed successfully. Your Database tables, functions and stored procedures will be created and database setup will be completed. 


# Commands 

Command for building project
```sh
dotnet build
```

Command for cleaning project
```sh
dotnet clean
```

Command for running project 
```sh
dotnet run
```
once project is running we can open the project on browser with link
```sh
http://localhost:5000/swagger/index.html
```

This is the url for testing backend web APIs of `Todo-list app`
```sh
http://92.204.135.120:9090/swagger/index.html
```



