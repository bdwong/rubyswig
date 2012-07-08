require 'fileutils'
require 'parallel'

SWIG_VERSION='2.0.7'
PCRE_VERSION='8.30'
PROJECT_ROOT=File.expand_path(File.join(File.dirname(__FILE__), '..'))
EXT_ROOT=File.expand_path(File.dirname(__FILE__))
PWD=FileUtils.pwd

# Detect existing pcre library.
def pcre_installed?
  system "gcc -c #{EXT_ROOT}/findpcre.c -o /dev/null"
  $? == 0
end

# Download and build local version of pcre.
def install_pcre
  FileUtils.chdir(EXT_ROOT)
  system "wget http://sourceforge.net/projects/pcre/files/pcre/#{PCRE_VERSION}/pcre-#{PCRE_VERSION}.tar.gz"
  system 'Tools/pcre-build.sh'
end

def install_manpages(dest)
  begin
    FileUtils.chdir(PROJECT_ROOT)
    Dir.glob(File.join('share', 'man', '**', '*').each do |file|
      dest_file = File.join(dest, file)
      FileUtils.mkdir_p(File.dirname(file))
      FileUtils.rm(dest_file) if File.symlink?(dest_file) and not File.exists?(dest_file)
      FileUtils.ln_s(File.expand_path(file), dest_file)
    end
  #rescue permissions error
  end
end

def build_swig
  FileUtils.chdir(EXT_ROOT)
  system "wget http://prdownloads.sourceforge.net/swig/swig-#{SWIG_VERSION}.tar.gz"
  system "tar -zxsf swig-#{SWIG_VERSION}.tar.gz"
  FileUtils.chdir("swig-#{SWIG_VERSION}")

  # Requirement: pcre.
  if not pcre_installed? then
    install_pcre
  end

  # By using $PROJECT_ROOT, swig will be installed into the bin folder.
  # This is 
  system "./configure --prefix=#{PROJECT_ROOT}"

  processors = Parallel.processor_count
  if processors > 1
    system "make -j#{processors}"
  else
    system 'make'
  end
end

def install_swig
  system 'make install'
end

build_swig
install_swig
install_manpages('/usr/local')

FileUtils.chdir(PWD)
