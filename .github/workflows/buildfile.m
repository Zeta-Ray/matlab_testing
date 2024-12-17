function plan = buildfile
    % Define the build plan
    import matlab.buildtool.tasks.CodeIssuesTask
    import matlab.buildtool.tasks.TestTask

    % Create a plan from local functions
    plan = buildplan(localfunctions);

    % Add a task to identify code issues
    plan("check") = CodeIssuesTask;

    % Add a task to run tests
    plan("test") = TestTask;

    % Make the "archive" task the default task in the plan
    plan.DefaultTasks = "archive";

    % Make the "archive" task dependent on the "check" and "test" tasks
    plan("archive").Dependencies = ["check", "test"];
end

function archiveTask(~)
    % Create ZIP file with a timestamp
    filename = "source_" + string(datetime("now", 'Format', "yyyyMMdd'T'HHmmss"));
    
    % Create a ZIP file of all files in the current folder
    zip(filename, "*");
end
