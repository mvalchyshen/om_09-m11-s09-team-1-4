package com.softserve.itacademy.controller;

import com.softserve.itacademy.model.Error;
import com.softserve.itacademy.model.Priority;
import com.softserve.itacademy.model.Task;
import com.softserve.itacademy.repository.TaskRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = {"/edit-task"})
public class UpdateTaskServlet extends HttpServlet {

    private TaskRepository taskRepository;

    @Override
    public void init() {
        taskRepository = TaskRepository.getTaskRepository();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Task task = taskRepository.read(Integer.parseInt(request.getParameter("id")));

        if (task != null) {
            response.setStatus(200);
            response.addHeader("Content-Type","text/html;charset=UTF-8");
            request.setAttribute("task", task);
            request.getRequestDispatcher("/WEB-INF/pages/edit-task.jsp").forward(request, response);
        }else {
            response.setStatus(404);
            response.addHeader("Content-Type","text/html;charset=UTF-8");
            request.setAttribute("error", new Error("Task with ID '" + request.getParameter("id") +
                    "' not found in To-Do List!", "/edit-task"));
            request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        Task task = taskRepository.read(Integer.parseInt(request.getParameter("id")));
        String title = request.getParameter("title");
        Priority priority = Priority.valueOf(request.getParameter("priority"));

        if (title.isBlank()) {
            request.setAttribute("message", "Expected value in input field but it was empty!");
            doGet(request, response);
        }else if (task == null){
            doGet(request,response);
        }else if (updateTask(task, title, priority)){
            response.addHeader("Content-Type","text/html;charset=UTF-8");
            response.sendRedirect("/tasks-list");
        }else{
            request.setAttribute("message", "Task with a given name already exists!");
            doGet(request, response);
        }
    }

    private boolean updateTask(Task task, String newTitle, Priority newPriority){
        task.setTitle(newTitle);
        task.setPriority(newPriority);
        return taskRepository.update(task);
    }
}
