*** Settings ***
Documentation    This file lists all the variables from the test files.



*** Variables ***
@{LIST_COLORS}     White    Pink    Orange    Black    Red
@{LIST_ANIMALS}    Panda    Dog    Elephant    Cat    Bear
@{LIST_DOGS}       Dachshund    Dalmatian    Yorkshire    Poodle    German Shepherd
@{LIST_TYPE}       Fire    Robbery    Assault    Homicide    Vehicle    Drugs    Prisoner
@{LIST_PRIORITY}   Low    Medium    High    Critical    Emergency    Urgent    Routine

&{DIC_MOVIES}      best=Up    worst=Peter Pan    newest=Stitch    oldest=Snow White
&{DIC_CITIES}      famous=Paris    fun=Las Vegas    beautiful=Amsterdam

${BASE_URL}        http://localhost:5000