#!/usr/bin/perl
use strict;
use warnings;
use DBI;

sub validate;
sub process;
sub sql_init;
sub sql_insert;

my $db = sql_init;

#main loop
process validate $_ while (<STDIN>);

sub validate {
	my $arg = shift;
	chomp $arg;
	if ($arg =~ /^(\d{8})\s(\d+)$/) {
		return ($1, $2);
	}
	else {
		die "Invalid input: $arg\n" 
		  . "Expecting input of the form \"12345678 123456...\"\n";
	}
}

sub process {
	my ($id, $barcode) = @_;
	sql_insert $id, $barcode, time;
}

sub sql_init {
	my $db_handle = DBI->connect('dbi:SQLite:concessions.db', '', '',
			{RaiseError => 0, AutoCommit => 1});

	# create the 'purchases' table unless it already exist
	unless ($db_handle->do('SELECT * FROM purchases')) {
		$db_handle->do('CREATE TABLE purchases (id TEXT, barcode TEXT, timestamp NUMERIC)');
	}
	return $db_handle;
}

sub sql_insert {
	my ($id, $barcode, $timestamp) = @_;
	# prepare a cached insert statement once
	my $ins_stmt = $db->prepare_cached('INSERT INTO purchases VALUES (?, ?, ?)')
		or die "Somehow the insert statement preperation failed: "
			. $db->errstr;
	$ins_stmt->execute(($id, $barcode, $timestamp));
}
