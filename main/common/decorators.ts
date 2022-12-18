import { IUserService } from "./interface.decorators";

@nullUser
class UserService implements IUserService {  
    public users: number = 1000;  
  
    getUsersInDatabase(): number {  
        return this.users;  
    }  
}  
  
function nullUser(target: Function) {
    target.prototype.users = 0; 
}

export const logger = () => console.log("Time" + new UserService().getUsersInDatabase());