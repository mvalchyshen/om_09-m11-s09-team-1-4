
# Java EE, Servlets

Using **Servlet API, JSP, HTML** and **CSS** create a simple Web Application for working with the To-Do List.

Created Web Application should be able to:

 - **Create** a new **Task** with given **Priority**.
 - **View** info about the **Task** from the To-Do List.
 - **Edit** the **Task** from the **To-Do List**.
 - **Delete** the Task from the **To-Do List**.
 - Show all Tasks from the To-Do List.
For all given above operations should be used a **Web Interface**.



1. _Home page_ with references to other pages.

```http
  http://<host-name:port>/home
```

2. The page for _creating a new task_ and saving its in the To-Do List.
```http
  http://<host-name:port>/create-task
```
The **Priority** is an enum with values **_'Low', 'Medium', 'High'_**.

If _a task with a given name already exists_ in the To-Do List, then make _redirect_ to the same page and display info about error.

3. Page with _all tasks_ from To-Do List organized in a table and _hyperlinks buttons_ for reading, editing and deleting tasks.
```http
  http://<host-name:port>/tasks-list
```

4. The page for _viewing info_ about task that correspond to ID specified through the request parameters.

```http
http://<host-name:port>/read-task?id=<task ID>
```

If the _task with the given ID is not found_ in the To-Do List, then make _redirect to the error page and return the status code 404_.

5. The page for _edit an existing task_ that correspond to ID specified through the request parameters.

```http
http://<host-name:port>/edit-task?id=<task ID>
```

If the _task with the given ID is not found_ in the To-Do List, then make _redirect to the error page and return the status code 404_.

6. The 'Delete' button _deletes the task_ that correspond to ID specified through the request parameters from To-Do List and the table.

```http
http://<host-name:port>/delete-task?id=<task ID>
```

* Forbidden to use pure JavaScript and JavaScript libraries like jQuery.
* All pages should be contains a valid HTML and CSS code.

*** Record a short video (5 -10 minutes) where demonstrate the functionality your Web Application and publish it in your YouTube channel.
Submission status
