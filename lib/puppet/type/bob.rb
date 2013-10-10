Puppet::Type.newtype(:bob) do
  @doc = "Manage a bob (the simple version)."

  ensurable

  newparam(:name) do
    desc "The full path to the bob."
  end

  newproperty(:mode) do
    desc "Manage the bob's mode."

    defaultto "640"
  end

end