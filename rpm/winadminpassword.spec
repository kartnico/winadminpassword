Name:           winadminpassword
Version:        1.5
Release:        0.1%{?dist}
Summary:        Tool for the deployment of unique passwords for Windows and Unix systems.

Group:          System/Base
License:        GPL
URL:            http://winadminpasswd.sourceforge.net
Source0:        %{name}-%{version}.tgz
BuildRoot:      %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildArch:	noarch

Requires:       dmidecode, perl-Config-Crontab, perl-Digest-SHA1

%description
Tool for the deployment of unique passwords for Windows and
Unix systems. It is based on the serial number of computers
and a secret key. The advantage is that no password is stored
in a database and you can display them with a GLPI plugin,
Webmin, Web Page...


%prep
%setup -q


%build
%{__perl} Makefile.PL INSTALLDIRS=vendor
make %{?_smp_mflags}


%install
rm -rf $RPM_BUILD_ROOT
make install DESTDIR=$RPM_BUILD_ROOT


%clean
rm -rf $RPM_BUILD_ROOT


%files
%defattr(-,root,root,-)
%doc CHANGELOG.TXT README.TXT
%{_bindir}/*
%{_mandir}/man1/*.1*


%changelog
* Thu Aug 10 2011 Nicolas BOURGES <nicolas.bourges@isep.fr> - 0.1
- First release.
