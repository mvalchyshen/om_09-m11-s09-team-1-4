package com.softserve.itacademy.controller;

import com.softserve.itacademy.model.Error;
import com.softserve.itacademy.model.Task;
import com.softserve.itacademy.repository.TaskRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = {"/read-task"})
public class ReadTaskServlet extends HttpServlet {

    private TaskRepository taskRepository;

    @Override
    public void init() {
        taskRepository = TaskRepository.getTaskRepository();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Task task = TaskRepository.getTaskRepository().read(Integer.parseInt(request.getParameter("id")));

        if (task != null) {
            request.setAttribute("task", task);
            request.getRequestDispatcher("/WEB-INF/pages/read-task.jsp").forward(request, response);
        }else {
            request.setAttribute("error", new Error("Task with ID '" + request.getParameter("id") +
                    "' not found in To-Do List!", "/read-task"));
            request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) {

    }
}
