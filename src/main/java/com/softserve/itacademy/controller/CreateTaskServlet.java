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
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

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
        doPostWithSendRedirect(request, response);
    }

    protected void doPostWithSendRedirect(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String title = request.getParameter("title");
        if (title.isBlank()) {
            request.setAttribute("message", "Expected value in input field but it was empty!");
            doGet(request, response);
        } else if (!addTask(request, title)) {
            request.setAttribute("message", "Task with a given name already exists!");
            doGet(request, response);
        } else {
            response.sendRedirect("/tasks-list");
        }
    }
    private boolean addTask(HttpServletRequest request, String title) throws IOException {
        Priority priority = Priority.valueOf(request.getParameter("priority"));
        return taskRepository.create(new Task(title, priority));
    }
}