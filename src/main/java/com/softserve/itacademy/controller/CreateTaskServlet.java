package com.softserve.itacademy.controller;

import com.softserve.itacademy.model.Priority;
import com.softserve.itacademy.model.Task;
import com.softserve.itacademy.repository.TaskRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = {"/create-task"})
public class CreateTaskServlet extends HttpServlet {

    private TaskRepository taskRepository;

    @Override
    public void init() {
        taskRepository = TaskRepository.getTaskRepository();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/create-task.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            doPostWithSendRedirect(request, response);
        } catch (Exception e) {
            response.sendRedirect("/error.jsp");
        }
    }

    protected void doPostWithSendRedirect(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        addTask(request);
        response.sendRedirect("/tasks-list");
    }

    private void addTask(HttpServletRequest request) throws IOException {
        String title = request.getParameter("title");
        Priority priority = Priority.valueOf(request.getParameter("priority"));

        if (title.isBlank()) {
            request.setAttribute("errorMessage", "Expected value in input field but it was empty!");
        } else
            taskRepository.create(new Task(title, priority));
    }

}
