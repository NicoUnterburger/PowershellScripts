$folder = ""

Get-ChildItem $folder -Directory -Recurse|
	ForEach-Object{
		[pscustomobject]@{
			FullName  = $_.Fullname
			FileCount = $_.GetFiles().Count
		}
	}
