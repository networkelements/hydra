package Hydra::Schema::ReleaseSetJobs;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("ReleaseSetJobs");
__PACKAGE__->add_columns(
  "project",
  { data_type => "text", is_nullable => 0, size => undef },
  "release_",
  { data_type => "text", is_nullable => 0, size => undef },
  "job",
  { data_type => "text", is_nullable => 0, size => undef },
  "attrs",
  { data_type => "text", is_nullable => 0, size => undef },
  "isprimary",
  { data_type => "integer", is_nullable => 0, size => undef },
  "mayfail",
  { data_type => "integer", is_nullable => 0, size => undef },
  "description",
  { data_type => "text", is_nullable => 0, size => undef },
  "jobset",
  { data_type => "text", is_nullable => 0, size => undef },
);
__PACKAGE__->set_primary_key("project", "release_", "job", "attrs");
__PACKAGE__->belongs_to("project", "Hydra::Schema::Projects", { name => "project" });
__PACKAGE__->belongs_to(
  "releaseset",
  "Hydra::Schema::ReleaseSets",
  { name => "release_", project => "project" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-03-13 13:33:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:iWBkyucz/pXtzI+s0iP0EA


# You can replace this text with custom content, and it will be preserved on regeneration
1;