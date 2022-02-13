<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Import Dari Siakad</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="index.php?r=subjects/import" method="post">
                    <div class="form-group">
                        <label for="">Jenis</label>
                        <select name="jenis" id="jenis" class="form-control" onchange="loadData()" required>
                            <option value="">- Pilih -</option>
                            <option value="dosen">Dosen</option>
                            <option value="mahasiswa">Mahasiswa</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">Nama / ID</label>
                        <input type="text" name="keyword" class="form-control" id="keyword" onkeyup="loadData()">
                    </div>
                    <div class="form-group">
                        <button class="btn btn-primary">Import</button>
                    </div>
                    <div class="form-group listData d-none">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nama</th>
                                </tr>
                            </thead>
                            <tbody id="responseData">
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script>
async function loadData()
{
    var jenis = document.querySelector('#jenis').value
    if(jenis == '')
    {
        alert('Pilih Jenis Terlebih Dahulu')
        return
    }

    var keyword = document.querySelector('#keyword').value
    if(keyword)
    {
        if(jenis == 'mahasiswa')
            keyword = '?NIM='+keyword
        else if(jenis == 'dosen')
            keyword = '?NIDN='+keyword
        else keyword = ''
    }

    var tbody = document.querySelector('#responseData')
    tbody.innerHTML = '<tr><td colspan="4">Loading...</td></tr>'
    
    var request = await fetch('https://api.stikes-assyifa.ac.id/site/get-'+jenis+keyword)
    var response = await request.json()

    tbody.innerHTML = ''


    var listData = document.querySelector('.listData')
    listData.classList.remove('d-none')

    response.data.forEach(data => {
        if(jenis == 'mahasiswa')
            tbody.innerHTML += `<tr><td>${data.NIM}</td><td>${data.nama}</td></tr>`
        else
            tbody.innerHTML += `<tr><td>${data.NIDN}</td><td>${data.nama}</td></tr>`
    })

}
</script>