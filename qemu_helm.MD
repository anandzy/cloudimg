```sh

anandz@openshift:~$ qemu-img --help
qemu-img version 6.0.0 (Debian 1:6.0+dfsg-2expubuntu1.2)
Copyright (c) 2003-2021 Fabrice Bellard and the QEMU Project developers
usage: qemu-img [standard options] command [command options]
QEMU disk image utility

    '-h', '--help'       display this help and exit
    '-V', '--version'    output version information and exit
    '-T', '--trace'      [[enable=]<pattern>][,events=<file>][,file=<file>]
                         specify tracing options

Command syntax:
  amend [--object objectdef] [--image-opts] [-p] [-q] [-f fmt] [-t cache] [--force] -o options filename
  
  bench [-c count] [-d depth] [-f fmt] [--flush-interval=flush_interval] [-i aio] [-n] [--no-drain] [-o offset] [--pattern=pattern] [-q] [-s buffer_size] [-S step_size] [-t cache] [-w] [-U] filename
  
  bitmap (--merge SOURCE | --add | --remove | --clear | --enable | --disable)... [-b source_file [-F source_fmt]] [-g granularity] [--object objectdef] [--image-opts | -f fmt] filename bitmap
  
  check [--object objectdef] [--image-opts] [-q] [-f fmt] [--output=ofmt] [-r [leaks | all]] [-T src_cache] [-U] filename
  
  commit [--object objectdef] [--image-opts] [-q] [-f fmt] [-t cache] [-b base] [-r rate_limit] [-d] [-p] filename
  
  compare [--object objectdef] [--image-opts] [-f fmt] [-F fmt] [-T src_cache] [-p] [-q] [-s] [-U] filename1 filename2
  
  convert [--object objectdef] [--image-opts] [--target-image-opts] [--target-is-zero] [--bitmaps] [-U] [-C] [-c] [-p] [-q] [-n] [-f fmt] [-t cache] [-T src_cache] [-O output_fmt] [-B backing_file] [-o options] [-l snapshot_param] [-S sparse_size] [-r rate_limit] [-m num_coroutines] [-W] [--salvage] filename [filename2 [...]] output_filename
  
  create [--object objectdef] [-q] [-f fmt] [-b backing_file] [-F backing_fmt] [-u] [-o options] filename [size]
  
  dd [--image-opts] [-U] [-f fmt] [-O output_fmt] [bs=block_size] [count=blocks] [skip=blocks] if=input of=output
  
  info [--object objectdef] [--image-opts] [-f fmt] [--output=ofmt] [--backing-chain] [-U] filename
  
  map [--object objectdef] [--image-opts] [-f fmt] [--start-offset=offset] [--max-length=len] [--output=ofmt] [-U] filename
  
  measure [--output=ofmt] [-O output_fmt] [-o options] [--size N | [--object objectdef] [--image-opts] [-f fmt] [-l snapshot_param] filename]
  
  snapshot [--object objectdef] [--image-opts] [-U] [-q] [-l | -a snapshot | -c snapshot | -d snapshot] filename
  
  rebase [--object objectdef] [--image-opts] [-U] [-q] [-f fmt] [-t cache] [-T src_cache] [-p] [-u] -b backing_file [-F backing_fmt] filename
  
  resize [--object objectdef] [--image-opts] [-f fmt] [--preallocation=prealloc] [-q] [--shrink] filename [+ | -]size

Command parameters:
  'filename' is a disk image filename

  'objectdef' is a QEMU user creatable object definition. See the qemu(1)
    manual page for a description of the object properties. The most common
    object type is a 'secret', which is used to supply passwords and/or
    encryption keys.

  'fmt' is the disk image format. It is guessed automatically in most cases

  'cache' is the cache mode used to write the output disk image, the valid
    options are: 'none', 'writeback' (default, except for convert), 'writethrough',

    'directsync' and 'unsafe' (default for convert)

  'src_cache' is the cache mode used to read input disk images, the valid

    options are the same as for the 'cache' option

  'size' is the disk image size in bytes. Optional suffixes
    'k' or 'K' (kilobyte, 1024), 'M' (megabyte, 1024k), 'G' (gigabyte, 1024M),
    'T' (terabyte, 1024G), 'P' (petabyte, 1024T) and 'E' (exabyte, 1024P)  are
    supported. 'b' is ignored.

  'output_filename' is the destination disk image filename

  'output_fmt' is the destination format

  'options' is a comma separated list of format specific options in a
    name=value format. Use -o ? for an overview of the options supported by the
    used format
    
  'snapshot_param' is param used for internal snapshot, format
    is 'snapshot.id=[ID],snapshot.name=[NAME]', or
    '[ID_OR_NAME]'
  '-c' indicates that target image must be compressed (qcow format only)
  '-u' allows unsafe backing chains. For rebasing, it is assumed that old and
       new backing file match exactly. The image doesn't need a working
       backing file before rebasing in this case (useful for renaming the
       backing file). For image creation, allow creating without attempting
       to open the backing file.
  '-h' with or without a command shows this help and lists the supported formats
  '-p' show progress of command (only certain commands)
  '-q' use Quiet mode - do not print any output (except errors)
  '-S' indicates the consecutive number of bytes (defaults to 4k) that must
       contain only zeros for qemu-img to create a sparse image during
       conversion. If the number of bytes is 0, the source will not be scanned for
       unallocated or zero sectors, and the destination image will always be
       fully allocated
  '--output' takes the format in which the output must be done (human or json)
  '-n' skips the target volume creation (useful if the volume is created
       prior to running qemu-img)

Parameters to bitmap subcommand:
  'bitmap' is the name of the bitmap to manipulate, through one or more
       actions from '--add', '--remove', '--clear', '--enable', '--disable',
       or '--merge source'
  '-g granularity' sets the granularity for '--add' actions
  '-b source' and '-F src_fmt' tell '--merge' actions to find the source
       bitmaps from an alternative file

Parameters to check subcommand:
  '-r' tries to repair any inconsistencies that are found during the check.
       '-r leaks' repairs only cluster leaks, whereas '-r all' fixes all
       kinds of errors, with a higher risk of choosing the wrong fix or
       hiding corruption that has already occurred.

Parameters to convert subcommand:
  '--bitmaps' copies all top-level persistent bitmaps to destination
  '-m' specifies how many coroutines work in parallel during the convert
       process (defaults to 8)
  '-W' allow to write to the target out of order rather than sequential

Parameters to snapshot subcommand:
  'snapshot' is the name of the snapshot to create, apply or delete
  '-a' applies a snapshot (revert disk to saved state)
  '-c' creates a snapshot
  '-d' deletes a snapshot
  '-l' lists all snapshots in the given image

Parameters to compare subcommand:
  '-f' first image format
  '-F' second image format
  '-s' run in Strict mode - fail on different image size or sector allocation

Parameters to dd subcommand:
  'bs=BYTES' read and write up to BYTES bytes at a time (default: 512)
  'count=N' copy only N input blocks
  'if=FILE' read from FILE
  'of=FILE' write to FILE
  'skip=N' skip N bs-sized blocks at the start of input

Supported formats: blkdebug blklogwrites blkverify bochs cloop compress copy-on-read dmg file ftp ftps host_cdrom host_device http https iscsi iser luks nbd null-aio null-co nvme preallocate qcow qcow2 qed quorum raw rbd replication ssh throttle vdi vhdx vmdk vpc vvfat

See <https://qemu.org/contribute/report-a-bug> for how to report bugs.
More information on the QEMU project at <https://qemu.org>.


```