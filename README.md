#Kudos to: 
    https://github.com/mattgruter/dockerfile-artifactory
    https://github.com/fkirill/dockerfile-artifactory
          
# Artifactory

Run [Artifactory](http://www.jfrog.com/home/v_artifactory_opensource_overview) in Openshift

## Volumes
Artifactories `data`, `logs` and `backup` directories are exported as volumes:

    /artifactory

## Example
To run artifactory localy: 

    docker run -p 8080:8080 mangirdas/artifactory-openshift
    hit: http://localhost:8080/artifactory/webapp/

Tp run on Openshift:

    oc import-image mangirdas/artifactory-openshift:latest  --confirm
    oc new-app --image-stream=artifactory-openshift
    oc expose service artifactory-openshift

    OR 

    oc create -f Artifactory.yaml


## To build

Now build your child docker image:

    docker build -t yourname/artifactory-openshift .

