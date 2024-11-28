# Recreates head command in Unix/Linux.
function head {
[alias("h")]
	param(
        [Parameter(ValueFromPipeline=$true, Mandatory=$true)]
        [object]$InputObject,

        [Parameter(Mandatory=$true, Position=0)]
        [Alias("n")]
        [int]$Lines
    )

    begin {
        $collectedInput = @()
    }

    process {
        # Collect piped input into an array
        $collectedInput += $InputObject
    }

    end {
        # Output only the first X lines from the collected input
        $collectedInput | Select-Object -First $Lines
    }
}

