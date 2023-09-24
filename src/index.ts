import { AppDataSource } from './data-source';

AppDataSource.initialize()
    .then(async ds => {
        ds.destroy();
    })
    .catch(error => console.log(error));
