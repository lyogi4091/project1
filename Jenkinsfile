node {
    stage('SCM'){
        git 'git@github.com:lyogi4091/project1.git'
    stage('Applying condition'){
        try {
            withCredentials([usernamePassword(credentialsId: 'BitBucket-lyogi4091', passwordVariable: 'BB_password', usernameVariable: 'BB_username')])
            sh 'pycodestyle --ignore=E501 python.py';
            } catch(x) {
                println "The code is being formatted";
                sh 'autopep8 -i python.py';
                sh 'sudo docker build -t ubuntu_image_remotely .';
                sh 'sudo docker run -it -d --name testcontainer_remote -v /home/user/project:/opt ubuntu_image_remotely';
                sh 'sudo docker exec testcontainer_remote gcc -o /opt/yogesh /opt/file.c';
                sh 'sudo docker exec testcontainer_remote ./opt/yogesh'
                }
            echo 'The code is in good format..'
            }
    /*dir("/var/lib/jenkins/workspace/TestProject1") {
        try {
            sh 'git add python.py';
            sh 'git config --global user.name "Yogeshkumar"'
            sh 'git config --global user.email "lingojuyogesh.kumar@ltts.com>"'
            sh 'git commit -m "commit from jenkins after code format"';
            sh 'git push origin master'
            } catch(z) {
                println "There is nothing to add.";
            }
        }*/
    }
}
