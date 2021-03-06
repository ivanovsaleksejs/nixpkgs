{ lib
, buildPythonPackage
, fetchFromGitHub
, botocore
, jmespath
, s3transfer
, futures
, docutils
, nose
, mock
, isPy3k
}:

buildPythonPackage rec {
  pname =  "boto3";
  version = "1.7.57";

  src = fetchFromGitHub {
    owner = "boto";
    repo  = "boto3";
    rev   = version;
    sha256 = "0rp3vclx7mvfl6isa47m7dzlrf33qb9vj53p0gj4cw3mgl14cnbl";
  };

  propagatedBuildInputs = [ botocore jmespath s3transfer ] ++ lib.optionals (!isPy3k) [ futures ];
  checkInputs = [ docutils nose mock ];

  checkPhase = ''
    runHook preCheck
    # This method is not in mock. It might have appeared in some versions.
    sed -i 's/action.assert_called_once()/self.assertEqual(action.call_count, 1)/' \
      tests/unit/resources/test_factory.py
    nosetests -d tests/unit --verbose
    runHook postCheck
  '';

  # Network access
  doCheck = false;

  meta = {
    homepage = https://github.com/boto/boto3;
    license = lib.licenses.asl20;
    description = "AWS SDK for Python";
    longDescription = ''
      Boto3 is the Amazon Web Services (AWS) Software Development Kit (SDK) for
      Python, which allows Python developers to write software that makes use of
      services like Amazon S3 and Amazon EC2.
    '';
  };
}