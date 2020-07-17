#!/bin/bash

dnf -y install dnf install glibc-langpack-en
yum -y update && yum clean all
yum -y groupinstall "Development Tools"

cd /tmp

curl -LO https://downloads.activestate.com/ActivePerl/releases/5.24.3.2404/ActivePerl-5.24.3.2404-x86_64-linux-glibc-2.15-404865.tar.gz

tar -xf ActivePerl-5.24.3.2404-x86_64-linux-glibc-2.15-404865.tar.gz

cd ActivePerl-5.24.3.2404-x86_64-linux-glibc-2.15-404865

./install.sh --prefix /opt/perl --license-accepted --no-install-html --no-komodo

/opt/perl/bin/cpan -y install Paws
/opt/perl/bin/cpan -y install Data::Printer

cd /opt/perl
rm -rf html man

cd site
rm -rf html man

#Make sure that the folder exists before creating the link
mkdir -p /opt/bin/

ln -s /opt/perl/bin/perl /opt/bin/perl

cd /opt

curl -LO https://gist.githubusercontent.com/brewsfab/78bfa60bcc579af10eb51b3b454a75a4/raw/46aae5d119960bf07b88405d37d2b8742da80196/bootstrap
curl -LO https://gist.githubusercontent.com/brewsfab/78bfa60bcc579af10eb51b3b454a75a4/raw/46aae5d119960bf07b88405d37d2b8742da80196/perl_runtime.pl.tpl

chmod 755 bootstrap perl_runtime.pl.tpl

zip -r $SAVEDIR/perl.zip perl bin/perl -x perl/site/lib/Paws/\* -x perl/site/lib/Paws.pm
zip -r $SAVEDIR/paws.zip perl/site/lib/Paws perl/site/lib/Paws.pm
zip -r $SAVEDIR/perl-runtime.zip bootstrap perl_runtime.pl.tpl

