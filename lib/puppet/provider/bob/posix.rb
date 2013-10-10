Puppet::Type.type(:bob).provide(:posix) do
  desc "Normal Unix-like POSIX support for file management."

  def create
    File.open(@resource[:name], "w") { |f| f.puts "" } # Create an empty file
    # Make sure the mode is correct
    should_mode = @resource.should(:mode)
    unless self.mode == should_mode
      self.mode = should_mode
    end
  end

  # Return the mode as an octal string, not as an integer.
  def mode
    if File.exists?(@resource[:name])
        "%o" % (File.stat(@resource[:name]).mode & 007777)
    else
        :absent
    end
  end

  # Set the file mode, converting from a string to an integer.
  def mode=(value)
    File.chmod(Integer("0" + value), @resource[:name])
  end

  def destroy
    File.unlink(@resource[:name])
  end

  def exists?
    File.exists?(@resource[:name])
  end
end