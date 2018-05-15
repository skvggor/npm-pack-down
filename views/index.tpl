<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <link rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">

        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.min.css">

            <title>npm-pack-down - Check the amount of downloads of NPM packages.</title>
        </head>
        <body>
            <main class="main">
                <div class="container">
                    <header>
                        {{response}}
                        <h1>npm pack down</h1>
                    </header>

                    <div class="search">
                        <form action="/api/package-downloads" method="POST">
                            <div class="form-group">
                                <label for="package-name">Package name</label>
                                <input type="text" name="package-name" class="form-control" id="package-name" placeholder="Enter package name">
                            </div>

                            <div class="form-group row">
                                <div class="col">
                                    <label for="start-date">Start date</label>
                                    <input name="start-date" id="start-date" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker">
                                </div>

                                <div class="col">
                                    <label for="final-date">Final date</label>
                                    <input name="final-date" id="final-date" class="form-control" data-date-format="yyyy-mm-dd" data-provide="datepicker">
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>

                    <div class="result">

                    </div>

                    <footer>
                    </footer>
                </div>
            </main>

            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
                integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
                crossorigin="anonymous"></script>

            <script src="https://code.jquery.com/jquery-3.3.1.min.js"
                integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
                crossorigin="anonymous"></script>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"
                integrity="sha256-tW5LzEC7QjhG0CiAvxlseMTs2qJS7u3DRPauDjFJ3zo="
                crossorigin="anonymous"></script>
    </body>
</html>
