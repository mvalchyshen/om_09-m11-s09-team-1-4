package com.softserve.itacademy.controller;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;

@RunWith(Suite.class)
@Suite.SuiteClasses({
        DeleteTaskServletTest.class,
        CreateTaskServletTest.class,
        ReadTaskServletTest.class,
        UpdateTaskServletTest.class,
        TasksListServletTest.class
})
public class ToDoListWebAppSuite {  }
