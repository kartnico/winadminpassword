use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
	'NAME'			=> 'WinAdminPassword',
	'VERSION_FROM'	=> 'bin/winadminpassword',		# finds $VERSION
	'PREREQ_PM'	=> {
				Config::Crontab => 0.00,
				Digest::SHA1 => 0.00,
				Getopt::Long => 0.00,
			},
	'EXE_FILES'		=> ['bin/winadminpassword'],
	($] ge '5.005') ? (
		'AUTHOR'	=> 'Nicolas BOURGES (nicolas.bourges@isep.fr)',
		'ABSTRACT'	=> 'Tool for the deployment of unique passwords for Windows and Unix systems.') : (),
);
