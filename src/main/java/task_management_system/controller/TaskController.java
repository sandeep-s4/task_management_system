package task_management_system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import task_management_system.model.Task;
import task_management_system.repository.TaskDao;

@Controller
public class TaskController {
	
	@Autowired
	private TaskDao dao;
     
	// This URL is to open the home page, as soon as we hit the / url (automatically)
	@GetMapping("/")
	public String getMessage(Model model) {
		List<Task>task=dao.getAllTask();
		model.addAttribute("task", task);
		return "home";
	}
	
	// To open add task form
	@GetMapping("/add-task")
	public String addTask() {
		return "addtask";
	}
	
    // readFormData is a controller. 
	// On clicking the submit button, the data will be available at the controller
	@PostMapping("/handle-task")
	public String handleTask(Task task) {
		System.out.println(task.getId());
		System.out.println(task.getTitle());
		System.out.println(task.getDescription());
		
		boolean b=dao.addTaskDao(task);
		if(b) {
			System.out.println("task is added...");
		}else {
			System.out.println("task is not added...");
		}
		
		return "redirect:/";
	}
	
	// controller to delete particular record
	@PostMapping("/delete/{id}")
	public String deleteByID(@PathVariable("id") int id) {
		
		// it will take id and delete the record
		boolean b=dao.delelteTaskById(id);
		if(b) {
			System.out.println("task is deleted...");
		}else {
			System.out.println("task is not deleted...");
		}
		// it will redirect to home page
		return "redirect:/";
	}
	
	// open form to update record
	@GetMapping("/update/{id}")
	public String updateForm(@PathVariable("id") int id, Model model) {
	    Task task = dao.getTaskByID(id);
	    if (task == null) {
            return "redirect:/";
        }
        model.addAttribute("task", task);
        return "update-task";
	}
	
	// controller to read update data
	@PostMapping("/update-handle")
	public String handleTaskUpdate(Task task) {
		boolean b=dao.updateTaskDao(task);
		if(b) {
			System.out.println("task is updated...");
		}else {
			System.out.println("task is not updated...");
		}
		
		return "redirect:/";
	}
}