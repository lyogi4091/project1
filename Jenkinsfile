node {
    stage('SCM checkout'){
        git 'https://github.com/lyogi4091/project1.git'
    }
    //Building the Docker image from BitBucket repo
    stage('Building docker image'){
        sh 'sudo docker build -t ubuntu_image_remotely http://localhost:7990/scm/proj/proj1_repo.git'
    }
    //Running the container and volume mapping that container
    stage('Running the testbuild image'){
        sh 'sudo docker run -it -d --name testcontainer_remote -v /home/user/project1/proj1_repo:/opt ubuntu_image_remotely'
    }
    //Compiling the code upon the Docker container
    stage('Compiling the source code on docker container'){
        sh 'sudo docker exec testcontainer_remote gcc -o /opt/yogesh /opt/file.c'
    }
    stage('Output from Docker'){
        sh 'sudo docker exec testcontainer_remote ./opt/yogesh'
    }
    stage('Showcasing the script before autopep8'){
       sh 'sudo docker exec testcontainer_remote cat /opt/python.py'
    }
    stage('Applying condition'){
        try {
            sh 'sudo docker exec testcontainer_remote pycodestyle --ignore=E501 /opt/python.py';
            } catch(x) {
                println "The code is being formatted";
                sh 'sudo docker exec testcontainer_remote autopep8 -i /opt/python.py';
                }
            echo 'The code is in good format'
            }
    stage('Pushing the Formatted code'){
        git credentialsId: '0c2f4a3f-a167-47bd-a1f1-f922abe61179', url: 'http://localhost:7990/scm/proj/proj1_repo.git'
            try {
                sh 'git add python.py';
                sh 'git commit -m "commit after code format"';
                sh 'git push origin master';
            } catch(y) {
                println "Nothing to add";
                
            }
        
    }
    }
