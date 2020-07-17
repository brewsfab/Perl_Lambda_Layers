# Perl_Lambda_Layers

Allow to run Perl scripts on AWS Lambda.
In fact, Perl is not supported for Lambda.
Fortunately, AWS Lambda provides a Runtime API with Layers that allow to run other scripts.

This project is inspired by this Medium article [Playing with Perl-based Lambda functions](https://medium.com/foundations/playing-with-perl-based-lambda-functions-37c12ca01ae6)
It helps creating the layers from a container on a local machine rather than on an EC2 instance as mentioned in the article. Also, here the process is fully automated.

To save time, there are already prepared zip files (layers) with Perl 5.26.3 in [prebuilt_layers_perl_5_26_3](/prebuilt_layers_perl_5_26_3)
Please use them if you have no intention to modify.
Indeed, the time from the build to the creation of the layer files was around around 45 min on my actual system.

The prebuilt layers are :
* perl.zip : Perl libraries
* paws.zip : Perl libraries to interact with AWS services
* perl-runtime.zp : Libraries provided by AWS Lambda as Runtime API

Or, you can use the [Dockerfile](Dockerfile) in conjunction with the [fullinstall.sh](fullinstall.sh) to create these layers allowing you to make changes.

Using the Dockerfile pulling the latest centos image, one can create zip files of the necessary perl libraries in order to use it as a dependency (layer) in AWS Lambda.

```Dockerfile
docker build -t <chosen_image_name> .
```

Make sure to read the ActivePerl license and agree before running the script as it is implicitly accepting them to automate the process.
[ActiveState License Agreements (EULA)](https://www.activestate.com/support/eulas/)

After creating the image containing all the libraries, one can copy them back on the host machine with the mount volume option as in:

```sh
docker run -it -v <hostpath>:<path_in_container> <chosen_image_name>
```
Here *path_in_container* should be different to the path specified in the ENV variable from the [Dockerfile](Dockerfile).

And from inside the container, in order to collect the files from the host, do

```sh
cp -r $SAVEDIR/* <path_in_container>
```

